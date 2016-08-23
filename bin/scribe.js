#! /usr/bin/env node
var shell = require('shelljs');
var antlr4 = require('antlr4');
var HelloLexer = require('../grammar/HelloLexer.js').HelloLexer;
var HelloListener = require('../grammar/HelloListener.js').HelloListener;
var HelloParser = require('../grammar/HelloParser.js').HelloParser;

var input = "hello bob"
var chars = new antlr4.InputStream(input);
var lexer = new HelloLexer(chars);
var tokens  = new antlr4.CommonTokenStream(lexer);
var parser = new HelloParser(tokens);
parser.buildParseTrees = true;
var tree = parser.r();
console.log(tree);
