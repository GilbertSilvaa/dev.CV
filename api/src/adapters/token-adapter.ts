export interface CreateTokenData {
  id: string;
  secret: string;
  expiresTime: number;
}
export interface VerifyTokenData {
  token: string;
  secret: string;
}

export interface TokenAdapter {
  createToken: (data: CreateTokenData) => string;
  verifyToken: (data: VerifyTokenData) => boolean;
}