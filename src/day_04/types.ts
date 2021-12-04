export interface Bingo {
  isBingo(): boolean;
  play(n: number): void;
  get score(): number;
  get numberOfRows(): number;
  get numberOfColumns(): number;
}

export type Game = {
  numbers: number[];
  boards: Bingo[];
};
