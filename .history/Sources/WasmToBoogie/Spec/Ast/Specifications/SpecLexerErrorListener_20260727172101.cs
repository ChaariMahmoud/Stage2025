using System.IO;
using Antlr4.Runtime;

namespace WasmToBoogie.Spec.Specifications
{
    public sealed class SpecLexerErrorListener
        : IAntlrErrorListener<int>
    {
        public static SpecLexerErrorListener Instance { get; } = new();

        private SpecLexerErrorListener()
        {
        }

        public void SyntaxError(
            TextWriter output,
            IRecognizer recognizer,
            int offendingSymbol,
            int line,
            int charPositionInLine,
            string msg,
            RecognitionException e)
        {
            throw new SpecSyntaxException(
                line,
                charPositionInLine,
                msg
            );
        }
    }
}