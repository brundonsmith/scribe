#! /usr/bin/env node
var shell = require('shelljs');
var fs = require('fs');
var antlr4 = require('antlr4');
var ScribeLexer = require('../grammar/ScribeLexer.js').ScribeLexer;
var ScribeListener = require('../grammar/ScribeListener.js').ScribeListener;
var ScribeParser = require('../grammar/ScribeParser.js').ScribeParser;




KeyPrinter = function() {
  ScribeListener.call(this); // inherit default listener
  return this;
};

// inherit default listener
KeyPrinter.prototype = Object.create(ScribeListener.prototype);
KeyPrinter.prototype.constructor = KeyPrinter;

// override default listener behavior
KeyPrinter.prototype.exitKey = function(ctx) {
  console.log("Oh, a key!");
};




fs.readFile(__dirname + '/../test_scribe/test2.scrb', 'utf8', function(err, contents) {
  var scribeTest = contents;

  var input = scribeTest
  var chars = new antlr4.InputStream(input);
  var lexer = new ScribeLexer(chars);
  var tokens  = new antlr4.CommonTokenStream(lexer);
  var parser = new ScribeParser(tokens);
  parser.buildParseTrees = true;
  var tree = parser.scribe();

  var printer = new KeyPrinter();
  antlr4.tree.ParseTreeWalker.DEFAULT.walk(printer, tree);
});
