using System.IO;
using Antlr4.Runtime;

namespace WasmToBoogie.Spec.Specifications
{
    public sealed class SpecParserErrorListener : BaseErrorListener
    {
        public static SpecParserErrorListener Instance { get; } = new();

        private SpecParserErrorListener()
        {
        }

        public override void SyntaxError(
            TextWriter output,
            IRecognizer recognizer,
            IToken offendingSymbol,
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