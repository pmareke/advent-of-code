import crypto from 'crypto';

export function md5(contents: string) {
  return crypto.createHash('md5').update(contents).digest('hex');
}
