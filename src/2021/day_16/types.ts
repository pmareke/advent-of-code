export interface Package {
  packages: Package[];
  version: number;
  type: number;
  literal: number;
  sum(): number;
}
