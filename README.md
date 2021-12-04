# Advent of Code

Advent of Code 2021 with Typescript.

## To build and run the project

This project uses Node, Typescript and Jest for testing.

1. Create an account at adventofcode.com
2. Get the input files and replace the current ones inside the `inputs folder
3. Install dependencies:

```sh
npm install
```

4. Run the tests:

```
npm run test
```

## Log

### Day 1

I solved this first puzzle slicing the input array, for **part one** with a slice of **1** and for **part two** with a slice of **3**, and comparing the values of the arrays.

```javascript
function findIncreasesWithStep(input: number[], step: number): number {
  return input
    .slice(step)
    .reduce(
      (acc, measurement, index) => (measurement > input[index] ? ++acc : acc),
      0,
    );
}
```

```
[ 1, 2, 3, 4 ] => Slice of one => [ 2, 3, 4 ] => [ 1 > 2 ], [ 2 > 3 ], [ 3 > 4 ]
[ 1, 2, 3, 4, 5, 6, 7 ] => Slice of three => [ 4, 5, 6, 7 ] => [ 1 > 4 ], [ 2 > 5 ], [ 3 > 6 ], [ 4 > 7 ]
```

This solution is valid as it's the same `1 + 2 + 3 > 2 + 3 + 4` as `1 > 4` because `2` and `3` are in both sides of the operation.

### Day 2

My first approach was using just functions but later I refactor it to classes. It was the perfect opportunity to improve my skills with **types, interfaces, classes, heritance and abstract**.

First I defined a basic interface with all the needed methods:

```javascript
export interface Submarine {
  down(distance: number): void;
  execute(command: Command): void;
  forward(distance: number): void;
  run(): void;
  up(distance: number): void;
}
```

Then I implement this interface in an abstract class with implementation fore the commmon logic in all of its childs.

Finally I extended this clas for each case and override the methods with are different.

```javascript
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

  ...
}

export class OldSubmarine extends BaseSubmarine {
  forward(distance: number): void {...}
  up(distance: number): void {...}
  down(distance: number): void {...}
  ...
}

export class NewSubmarine extends BaseSubmarine {
  forward(distance: number): void {...}
  up(distance: number): void {...}
  down(distance: number): void {...}
  ...
}
```

### Day 3

Today's puzzle was a good opportunity to try reccursion!.

In both parts we need to know wich are the most common number by position, **1** or **0**, but in the later one we need to filter the input array based in that info and apply reccursion.

```javascript
function mostCommon(input: string[]): string {
  const length = input.length;
  const zeros = Array.from < number > { length: input[0].length }.fill(0);

  const ocurrencesByPosition = input.reduce((acc, line) => {
    line.split('').reduce((acc, num, index) => {
      acc[index] += Number(num);
      return acc;
    }, acc);
    return acc;
  }, zeros); // [ 1111, 1110, 1100, 1000 ] => [4, 3, 2, 1]

  return ocurrencesByPosition.reduce(
    (acc, times) => (acc += length - times > length / 2 ? '0' : '1'),
    '',
  ); // [4, 3, 2, 1] => [1, 1, 1, 0]
}
```

### Day 4

The main idea behind this puzzle was to build an entity called `Bingo` which can plays and keep an internal state about the game.

This class implments a basic interface called `Board`:

```javascript
export interface Board {
  isBingo(): boolean;
  play(n: number): void;
  get result(): number;
}
```

In the **part one** after parsing the input getting the numbers and the boards to play is just play over and over until a winner appears.

In the **part two** is the same approach but in this case we need to find which boards wins the last.
