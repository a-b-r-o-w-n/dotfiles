import { chalk } from "zx";

class Logger {
  constructor(ns) {
    this.ns = ns;
  }

  error(...args) {
    console.error(chalk.gray(`[${this.ns}]:`), ...args);
  }
}

export function createLogger(namespace = "unknown") {
  return new Logger(namespace);
}
