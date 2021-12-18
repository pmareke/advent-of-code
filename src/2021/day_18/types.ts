export type Snailfish = {
  type: 'leaf' | 'node';
  parent?: Snailfish;
  left?: Snailfish;
  right?: Snailfish;
  value?: number;
};
