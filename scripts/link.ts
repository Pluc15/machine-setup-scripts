import * as fs from "fs";

link(`${process.env.HOME}/.dotfiles/configs`, process.env.HOME);

function link(from: string, to: string) {
  const links = getLinks(from, to);
  links.forEach(link => {
    fs.symlinkSync(link.from, link.to);
  });
  console.table(links);
}

function getLinks(from: string, to: string) {
  const files = fs.readdirSync(from);
  let links = [];

  files.forEach(function(file) {
    const fileInfo = fs.lstatSync(`${from}/${file}`);
    const targetInfo = fs.existsSync(`${to}/${file}`)
      ? fs.lstatSync(`${to}/${file}`)
      : null;
    if (!fs.existsSync(to)) fs.mkdirSync(to);

    if (fileInfo.isDirectory()) {
      getLinks(`${from}/${file}`, `${to}/${file}`).forEach(link => {
        links.push(link);
      });
    } else if (fileInfo.isFile()) {
      if (targetInfo) {
        if (targetInfo.isSymbolicLink()) {
          console.warn(`'${from}/${file}' already linked; skipping`);
          return;
        } else if (targetInfo.isFile()) {
          console.warn(
            `'${from}/${file}' exists; renaming to back '${file}.bck'`
          );
          fs.renameSync(`${to}/${file}`, `${to}/${file}.bck`);
        } else {
          throw "Destination file is neither a file or a symbolic link";
        }
      }
      links.push({ from: `${from}/${file}`, to: `${to}/${file}` });
    } else {
      throw "Source file is neither a file or directory";
    }
  });
  return links;
}
