/*
 *  Jake build process
 *  1. run static code analysis - JSHint
 *  2. run unit tests - Mocha
 */

/*global desc, task, jake, fail, complete, directory*/
(function() {
  "use strict";

  desc("Build and test");
  task("default", ["lint"]);

  desc("Lint everything");
  task("lint", [], function() {
    var lint = require("./build/lint/lint_runner.js");

    var javascriptFiles = new jake.FileList();
    javascriptFiles.include("**/*.js");
    javascriptFiles.exclude(["node_modules","build"]);
    var options = nodeLintOptions();
    var passed = lint.validateFileList(javascriptFiles.toArray(), options, {});
    if (!passed) fail("Lint failed");
  });

  /*(desc("Test everything");
  task("test", [], function() {
    jake.exec(["npm test"], {printStdout: true});
  }, {async: true});*/

  function nodeLintOptions() {
    return {
      bitwise:true,
      curly:false,
      eqeqeq:true,
      forin:true,
      immed:true,
      latedef:true,
      newcap:true,
      noarg:true,
      noempty:true,
      nonew:true,
      regexp:true,
      undef:true,
      strict:true,
      trailing:true,
      node:true
    };
  }
}());
