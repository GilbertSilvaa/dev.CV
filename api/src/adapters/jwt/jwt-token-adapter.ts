import { sign, verify } from 'jsonwebtoken';

import { TokenAdapter, VerifyTokenData, CreateTokenData } from '../token-adapter';

export class JwtTokenAdapter implements TokenAdapter {

  createToken({ id, secret, expiresTime }: CreateTokenData) {
    const token = sign({ id }, secret, {
      expiresIn: expiresTime
    });
    
    return token;
  }

  verifyToken({ token, secret }: VerifyTokenData) {
    const accessToken = verify(token, secret);

    return typeof(accessToken) === 'string' ? false : true;
  }
}