import { Bingo } from './types';

export class BaseBingo implements Bingo {
  private last = 0;
  private rows: number[][] = [];
  private columns: number[][] = [];

  constructor(numbers: string[]) {
    this.rows = this.getRows(numbers);
    this.columns = this.getColumns();
  }

  private getRows(numbers: string[]): number[][] {
    return numbers.reduce((acc, line, index) => {
      acc[index] = line
        .split(' ')
        .filter((l) => l !== '')
        .map(Number);
      return acc;
    }, [] as number[][]);
  }

  private getColumns(): number[][] {
    return this.rows.reduce<number[][]>((acc, _, index) => {
      acc[index] = [];
      for (let j = 0; j < this.rows.length; j++) {
        acc[index].push(this.rows[j][index]);
      }
      return acc;
    }, []);
  }

  play(n: number): void {
    this.last = n;
    this.rows.forEach((_, index) => {
      this.rows[index] = this.rows[index].filter((x) => x !== n);
      this.columns[index] = this.columns[index].filter((x) => x !== n);
    });
  }

  get score(): number {
    return this.last * this.unseenNumbersSum();
  }

  private unseenNumbersSum(): number {
    return this.rows.flat().reduce((acc, x) => (acc += x), 0);
  }

  isBingo(): boolean {
    return this.isBingoInRows || this.isBingoInColumns;
  }

  private get isBingoInRows(): boolean {
    return this.rows.some((c) => c.length === 0);
  }

  private get isBingoInColumns(): boolean {
    return this.columns.some((c) => c.length === 0);
  }

  get numberOfRows(): number {
    return this.rows.length;
  }

  get numberOfColumns(): number {
    return this.columns.length;
  }
}
