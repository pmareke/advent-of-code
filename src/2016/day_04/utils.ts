import { Room } from './types';

export function parseLines(lines: string[]): Room[] {
  const regex = /([a-z].*){1,}-([0-9].*)\[(\w.*)\]/;
  return lines.reduce((acc, line) => {
    const groups = line.match(regex) ?? [];
    acc.push({
      name: groups[1],
      dash: Number(groups[2]),
      checksum: groups[3],
    } as Room);
    return acc;
  }, [] as Room[]);
}

export function isReal(room: Room): boolean {
  const m = room.name.split('-').reduce((acc, block) => {
    block.split('').forEach((letter) => {
      acc.set(letter, (acc.get(letter) ?? 0) + 1);
    });
    return acc;
  }, new Map());
  const sorted = new Map(
    [...m.entries()].sort((a, b) => {
      if (a[1] === b[1]) {
        return (a[0] as string).charCodeAt(0) - (b[0] as string).charCodeAt(0);
      } else {
        return b[1] - a[1];
      }
    }),
  );
  return [...sorted.keys()].slice(0, room.checksum.length).every((key, idx) => {
    return key === room.checksum.charAt(idx);
  });
}

export function decrypt(name: string, id: number): string {
  name = name.replace(/-/g, ' ');
  let room = '';
  for (let i = 0; i < name.length; i++) {
    const letter = name[i];
    if (letter === ' ') {
      room += ' ';
      continue;
    }
    const x = letter.charCodeAt(0) + (id % 26);
    room += String.fromCharCode(x > 122 ? x - 26 : x);
  }
  return room;
}
