import * as fs from "fs";
import * as path from "path";

var walOutputFilePath = path.join(
  process.env.HOME,
  ".cache/wal/vscode-color-overrides.json"
);
var settingsFilePath = path.join(
  process.env.DOTFILES,
  "configs/.config/Code - OSS/User/settings.json"
);
var walOutputJson = JSON.parse(fs.readFileSync(walOutputFilePath).toString());
var settingsJson = JSON.parse(fs.readFileSync(settingsFilePath).toString());
settingsJson["workbench.colorCustomizations"] = walOutputJson;
var settingsString = JSON.stringify(settingsJson, null, 2);
fs.writeFileSync(settingsFilePath, settingsString);
