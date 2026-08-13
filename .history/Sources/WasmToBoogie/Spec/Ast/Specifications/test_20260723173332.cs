using System;
using WasmToBoogie.Parser.Specifications;

var directive = SpecParser.Parse(
    "@requires 0 <= active_requests && active_requests <= MAX_REQUESTS"
);

Console.WriteLine(directive.Kind);
Console.WriteLine(directive.Expression);