export const codeIsOK = (code: number) => code >= 200 && code < 300;

export const codeIsWarning = (code: number) => code >= 300 && code < 400;

export const codeIsError = (code: number) => code >= 400 && code < 500;

export const codeIsInfo = (code: number) => code >= 500 && code < 600;