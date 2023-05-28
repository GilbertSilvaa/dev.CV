export interface EncryptData {
  password: string;
}
export interface VerifyPasswordData {
  passwordSent: string;
  passwordCorrect: string;
}

export interface EncryptAdapter {
  encrypt: (data: EncryptData) => Promise<string>;
  verifyPassword: (data: VerifyPasswordData) => Promise<boolean>;
}