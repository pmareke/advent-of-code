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

This class implements a basic interface called `Board`:

```javascript
export interface Board {
  isBingo(): boolean;
  play(n: number): void;
  get result(): number;
}
```

In the **part one** after parsing the input getting the numbers and the boards to play is just play over and over until a winner appears.

In the **part two** is the same approach but in this case we need to find which boards wins the last.

### Day 5

The main difficulty today was first parse the input and get a list of points in a 2D map:

```javascript
export type Points = {
  x1: number,
  y1: number,
  x2: number,
  y2: number,
};
```

With these points generate a Forest:

```javascript
export type Forest = {
  max: number,
  coordinates: Coordinates[],
};
export type Coordinates = {
  x: number,
  y: number,
};
```

And once we have the forest finally solve it!.

In order to that we need to draw vertical, horizonal and diagonal lines (in the **first part** we need to filters out the diagonals), and this was the hardest part.

When the lines are vertical or horizonal is just increase the only the axis that changes, but when the line is diagional we need to know steps in each direction:

```javascript
const stepX = x1 < x2 ? 1 : -1;
const stepY = y1 < y2 ? 1 : -1;
for (let i = 0; i <= Math.abs(x1 - x2); i++) {
  const x = x1 + i * stepX;
  const y = y1 + i * stepY;
  acc.push({ x, y });
}
```

### Day 6

Today was an easy day finally! The tricky part was that the **part one** could be solved using arrays but in the **part two** it produces and overflow, and because of that I needed to change the approach.

The main problem was counting the initial number of Lanternfishs per each day of life (from o to 8) and then iterate a **N** number of days, **part one** 80 and **part two** 256.

In each iteration the living lanternfishs decreases their number of days by one until this value is **zero**, in that case its value resets to **six** and a new lanternfish borns with a value of **8**.

```javascript
function play(days: number, initialState: number[]): number {
  const lanternfishsByAge = Array(9).fill(0);

  initialState.forEach((i) => {
    lanternfishsByAge[i]++;
  });

  for (let i = 0; i < days; i++) {
    const zeros = lanternfishsByAge[0];

    lanternfishsByAge.forEach((_, index) => {
      lanternfishsByAge[index] = lanternfishsByAge[index + 1]; // get older
    });

    lanternfishsByAge[6] += zeros; // every day new lanternfishs reset.
    lanternfishsByAge[8] = zeros; // every day new lanternfishs born.
  }

  return lanternfishsByAge.reduce((a, b) => a + b);
}
```

### Day 7

The **part one** was really straightforward, just calculate the median of the numbers and calculate the fuel of each number to this median.

But the **part two** was more difficult, my first approach was try to use brute force but the time was huge so I discarded it.

Finally I decided to:

- Sort the list of numbers.
- Iterate from the min to the max.
- For each case calculate the factorial total distance of all the numbers.
- Get the min of all distances.

### Day 8

Horrible day...the **part one** sooo easy and the **second part** soo boring.

The solution is not the best solution at all but it works.

Tomorrow is a new day!

### Day 9

The **part one** was about find if each point is the lowest of their neighbours, diagonals are not valid today, and sum hoy many lowers are.

The **second part** was the hardest one as you need to know if your neighbours are greather than you and also not nine. If they are valid neighbours you need to ask them for their neighbours and so on (recursion).

### Day 10

Finally and easy day, the key point today was saving the open characters in an array and pop them to validate that the lastest open is the pair of the current close one.

In the **part one** you have to find the incorrect lines and in the **part two** the incomoplete ones.

### Day 11

Just another day playing with neighbours in a grid.

In the **part one** we need to increase the value of each point by one and if the value after that is `0` we need to update again all of their neighbours except the one that are already `0`.

The main problem here is apply recursion until there is not elements to update.

The **part two** was really easy as the main difference was that now instead of itereate a fixed number of steps, we need to iterate until the grid is full of `0`s.

### Day 12

Todays puzzle was a graph in which we have to calculate all the posible routes using a modified version of the [DFS](https://en.wikipedia.org/wiki/Depth-first_search) algorithm.

The main difficulty was knowinf which algorithim uses.

### Day 13

The main problem today was parsing the input and then create the matrix. After that we had to fold the matrix based on some instructions and count a set of characters, nothing hard.

In the **part two** we had to iterate over all the intructions and readd the final code.

### Day 14

Today's problem was about parsing and later manipulate strings adding new ones based on the previous one. For the **part two** you can use the same approach as the number of elements in the arrays produces overflow. So we need to change the apporach and usea a Map to save the ocurrences and sum them at the end.

### Day 15

We need to find the shortest path between two points inside a 2D matrix, who said Dijkstra?
