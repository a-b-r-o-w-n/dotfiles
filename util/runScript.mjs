import { chalk, argv, path } from "zx";

$.verbose = false;

export async function runScript(logger, script) {
  try {
    const scriptName = path.basename(argv._[0]);
    const baseDir = path.resolve(
      path.dirname(path.resolve(process.env.DOTFILES_HOME, "bin", scriptName))
    );
    await script({ baseDir });
  } catch (err) {
    logger.error(chalk.red(err.message));
    logger.error(err);
    process.exit(1);
  }
}
