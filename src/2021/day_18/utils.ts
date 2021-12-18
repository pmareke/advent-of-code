/* eslint-disable @typescript-eslint/no-non-null-assertion */
import { Snailfish } from './types';

export function parseLines(input: string[]): number[] {
  return input.reduce((acc, line) => {
    acc.push(JSON.parse(line));
    return acc;
  }, [] as number[]);
}

export function makeTree(
  node: number | number[],
  parent: Snailfish | undefined = undefined,
): Snailfish {
  if (typeof node === 'number') return { type: 'leaf', value: node, parent };

  const self: Snailfish = { type: 'node', parent };
  self.left = makeTree(node[0], self);
  self.right = makeTree(node[1], self);
  return self;
}

export function addNodetoTree(tree: Snailfish, node: Snailfish): Snailfish {
  const self: Snailfish = { type: 'node', left: tree, right: node };
  tree.parent = self;
  node.parent = self;
  return self;
}

export function reduce(tree: Snailfish): Snailfish {
  let changed;
  do {
    changed = false;

    const res = explode(tree);
    if (res != undefined) {
      const [zeroTree, left, right] = res;
      const pieces = order(tree);
      const i = pieces.indexOf(zeroTree);
      if (i > 0) pieces[i - 1].value! += left;
      if (i < pieces.length - 1) pieces[i + 1].value! += right;
      changed = true;
    } else {
      changed = split(tree);
    }
  } while (changed);
  return tree;
}

export function magnitude(tree: Snailfish): number {
  if (tree.type === 'leaf') return tree.value!;
  return 3 * magnitude(tree.left!) + 2 * magnitude(tree.right!);
}

const order = (x: Snailfish): Snailfish[] =>
  x.type === 'leaf' ? [x] : order(x.left!).concat(order(x.right!));

function explode(
  x: Snailfish,
  depth = 0,
): [Snailfish, number, number] | undefined {
  if (
    x.type == 'node' &&
    x.left?.type == 'leaf' &&
    x.right?.type == 'leaf' &&
    depth >= 4
  ) {
    const zeroTree = makeTree(0, x.parent);

    if (x.parent?.left == x) {
      x.parent.left = zeroTree;
    } else if (x.parent?.right == x) {
      x.parent.right = zeroTree;
    }

    return [zeroTree, x.left.value!, x.right.value!];
  } else if (x.type == 'node') {
    const left = explode(x.left!, depth + 1);
    if (left != null) return left;

    const right = explode(x.right!, depth + 1);
    if (right != null) return right;
  }

  return undefined;
}

function split(x: Snailfish): boolean {
  if (x.type === 'leaf' && x.value! >= 10) {
    const newValue = [Math.floor(x.value! / 2), Math.ceil(x.value! / 2)];
    const newTree = makeTree(newValue, x.parent);

    if (x.parent?.left === x) {
      x.parent.left! = newTree;
    } else if (x.parent?.right === x) {
      x.parent.right = newTree;
    }
    return true;
  } else if (x.type === 'node') {
    if (split(x.left!) || split(x.right!)) return true;
  }

  return false;
}
