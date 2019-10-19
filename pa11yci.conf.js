/*!
  Pa11y-ci Configuration.
  Dynamically generate a '.pa11yci' JSON config object, using an environment variable.
*/

var defaults = {
  standard: "WCAG2AA",
  timeout: 5000,
  runners: ["axe", "htmlcs"],
  page: {
    viewport: {
      width: 1280,
      height: 1024
    }
  }
};

function pa11yCiConfiguration() {
  const fs = require("fs");
  var target = "";

  // If TARGET environment variable is set, use that as a base for URLs.
  if (process.env.TARGET) {
    target = process.env.TARGET;
  }
  var urls = [target];

  // If a pages.txt file is available, use that to generate a list of URLs.
  let pages = "pages.txt";
  if (fs.existsSync(pages)) {
    urls = [];
    var lines = fs
      .readFileSync(pages, "utf-8")
      .split("\n")
      .filter(Boolean);
    for (var line of lines) {
      // Trim trailing/leading slashes from the target and path, just in case.
      urls.push(target.replace(/[/]$/, "") + "/" + line.replace(/^[/]/, ""));
    }
  }

  console.log(urls);
  return {
    defaults: defaults,
    urls: urls
  };
}

// Important ~ call the function, don't return a reference to it!
module.exports = pa11yCiConfiguration();
