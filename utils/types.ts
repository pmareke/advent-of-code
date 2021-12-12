export type TestCase<Type extends string | number> = {
  name: string;
  input: Type[];
  expected: string | number;
  noun?: number;
  verb?: number;
};
