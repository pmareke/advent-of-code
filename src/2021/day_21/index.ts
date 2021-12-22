import { Game, Player } from './types';

export function solvePart1(input: string[]): number {
  const p1: Player = { score: 0, pawn: Number(input[0].split(': ')[1]) };
  const p2: Player = { score: 0, pawn: Number(input[1].split(': ')[1]) };

  let game: Game = { rolls: 0, p1, p2 };
  do {
    game = play(game, 1000);
  } while (game.p1.score < 1000 && game.p2.score < 1000);

  return Math.min(game.p1.score, game.p2.score) * game.rolls;
}

export function solvePart2(input: string[]): number {
  const p1: Player = { score: 0, pawn: Number(input[0].split(': ')[1]) };
  const p2: Player = { score: 0, pawn: Number(input[1].split(': ')[1]) };
  const wins: { p1: number; p2: number } = { p1: 0, p2: 0 };
  let game: Game = { rolls: 0, p1, p2 };
  do {
    game = play(game, 21);
  } while (game.p1.score < 21 && game.p2.score < 21);
  if (p1.score >= 21) {
    wins.p1++;
  } else {
    wins.p2++;
  }

  return Math.max(wins.p1, wins.p2);
}

let i = 1;
function play({ rolls = 1, p1, p2 }: Game, winningScore: number): Game {
  const dice1 = i % 100 === 0 ? 100 : i % 100;
  const dice2 = (i + 1) % 100 === 0 ? 100 : (i + 1) % 100;
  const dice3 = (i + 2) % 100 === 0 ? 100 : (i + 2) % 100;
  const dice4 = (i + 3) % 100 === 0 ? 100 : (i + 3) % 100;
  const dice5 = (i + 4) % 100 === 0 ? 100 : (i + 4) % 100;
  const dice6 = (i + 5) % 100 === 0 ? 100 : (i + 5) % 100;
  p1.pawn += dice1 + dice2 + dice3;
  p1.pawn = p1.pawn % 10 === 0 ? 10 : p1.pawn % 10;
  p1.score += p1.pawn;

  if (p1.score >= winningScore) {
    return {
      p1,
      p2,
      rolls: rolls + 3,
    };
  }

  p2.pawn += dice4 + dice5 + dice6;
  p2.pawn = p2.pawn % 10 === 0 ? 10 : p2.pawn % 10;
  p2.score += p2.pawn;

  i = dice6 === 100 ? 1 : dice6 + 1;
  return {
    rolls: rolls + 6,
    p1: p1,
    p2: p2,
  };
}
