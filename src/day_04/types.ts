export interface Board {
  isBingo(): boolean;
  play(n: number): void;
  get result(): number;
}

export type Game = {
  numbers: number[];
  boards: Board[];
};
