import { Command, Instructions, Submarine } from './types';
import { parseCommands } from './util';

abstract class BaseSubmarine implements Submarine {
  protected commands: Command[];
  protected horizontal = 0;
  protected deep = 0;

  constructor(input: string[]) {
    this.commands = parseCommands(input);
  }
  abstract forward(distance: number): void;
  abstract up(distance: number): void;
  abstract down(distance: number): void;

  get result(): number {
    return this.deep * this.horizontal;
  }

  private instructions: Instructions = {
    forward: (distance: number) => this.forward(distance),
    up: (distance: number) => this.up(distance),
    down: (distance: number) => this.down(distance),
  };

  run(): void {
    this.commands.forEach((command) => this.execute(command));
  }

  execute({ direction, distance }: Command): void {
    return this.instructions[direction](distance);
  }
}

export class OldSubmarine extends BaseSubmarine {
  forward(distance: number): void {
    this.horizontal += distance;
  }
  up(distance: number): void {
    this.deep -= distance;
  }
  down(distance: number): void {
    this.deep += distance;
  }
}

export class NewSubmarine extends BaseSubmarine {
  private aim = 0;

  forward(distance: number): void {
    this.horizontal += distance;
    this.deep += this.aim * distance;
  }

  up(distance: number): void {
    this.aim -= distance;
  }

  down(distance: number): void {
    this.aim += distance;
  }
}
