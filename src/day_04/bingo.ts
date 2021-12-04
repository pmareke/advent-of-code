import { Board } from './types';

export class Bingo implements Board {
  private last = 0;
  private rows: number[][] = [];
  private columns: number[][] = [];

  constructor(numbers: string[]) {
    this.rows = numbers.reduce((acc, line, index) => {
      acc[index] = line
        .split(' ')
        .filter((l) => l !== '')
        .map(Number);
      return acc;
    }, [] as number[][]);

    this.columns = this.rows.reduce<number[][]>((acc, _, index) => {
      acc[index] = [];
      for (let j = 0; j < this.rows.length; j++) {
        acc[index].push(this.rows[j][index]);
      }
      return acc;
    }, []);
  }

  play(n: number): void {
    this.last = n;
    for (let i = 0; i < this.rows.length; i++) {
      this.rows[i] = this.rows[i].filter((x) => x !== n);
    }

    for (let i = 0; i < this.columns.length; i++) {
      this.columns[i] = this.columns[i].filter((x) => x !== n);
    }
  }

  get result(): number {
    return this.last * this.unseen();
  }

  private unseen(): number {
    return this.rows.flatMap((x) => x).reduce((acc, x) => (acc += x), 0);
  }

  isBingo(): boolean {
    return this.bingoInRows || this.bingoInColumns;
  }

  private get bingoInRows(): boolean {
    return this.rows.some((c) => c.length === 0);
  }

  private get bingoInColumns(): boolean {
    return this.columns.some((c) => c.length === 0);
  }
}
