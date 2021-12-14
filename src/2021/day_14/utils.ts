import { Polymer } from './types';

export function createPolymer(input: string[]): Polymer {
  const template: { [key: string]: number } = {};
  const letters = input[0].split('');

  for (let i = 0; i < letters.length - 1; i++) {
    const key = `${letters[i]}${letters[i + 1]}`;
    template[key] = template[key] ? template[key] + 1 : 1;
  }

  const pairs = input.slice(2).reduce((acc, current) => {
    const [key, value] = current.split(' -> ');
    acc[key] = value;
    return acc;
  }, {} as { [key: string]: string });

  return {
    template,
    pairs,
  };
}

export function step(
  template: { [key: string]: number },
  pairs: { [key: string]: string },
) {
  return Object.keys(template).reduce((acc, key) => {
    const key1 = key[0] + pairs[key];
    const key2 = pairs[key] + key[1];
    acc[key1] = acc[key1] ? acc[key1] + 1 * template[key] : 1 * template[key];
    acc[key2] = acc[key2] ? acc[key2] + 1 * template[key] : 1 * template[key];
    return acc;
  }, {} as { [key: string]: number });
}

export function calculateOcurrences(template: { [key: string]: number }) {
  const ocurrences = Object.keys(template).reduce((acc, key) => {
    const letter = key.split('')[1];
    const times = template[key];
    acc[letter] = acc[letter] ? acc[letter] + times : times;
    return acc;
  }, {} as { [key: string]: number });

  const min = Math.min(...Object.values(ocurrences));
  const max = Math.max(...Object.values(ocurrences));

  return [min, max];
}
