using System;

namespace WasmToBoogie.Spec.Specifications
{
    public sealed class SpecSyntaxException : Exception
    {
        public int Line { get; }
        public int Column { get; }

        public SpecSyntaxException(
            int line,
            int column,
            string message)
            : base(
                $"Specification syntax error at " +
                $"line {line}, column {column}: {message}")
        {
            Line = line;
            Column = column;
        }
    }
}