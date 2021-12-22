export type Player = {
  pawn: number;
  score: number;
};

export type Game = {
  p1: Player;
  p2: Player;
  rolls: number;
};
