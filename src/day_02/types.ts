export type Direction = 'forward' | 'up' | 'down';

export type Instructions = {
  [key in Direction]: (distance: number) => void;
};

export type Command = {
  direction: Direction;
  distance: number;
};

export interface Submarine {
  down(distance: number): void;
  execute(command: Command): void;
  forward(distance: number): void;
  run(): void;
  up(distance: number): void;
}
