using System.IO;
using Antlr4.Runtime;
using Antlr4.Runtime.Misc;

namespace WasmToBoogie.Spec.Specifications
{
    public sealed class SpecErrorListener
        : BaseErrorListener
    {
        public static SpecErrorListener Instance { get; } = new();

        private SpecErrorListener()
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