namespace WasmToBoogie.Parser.Ast
{
    public abstract class WasmNode { }

    public class ConstNode : WasmNode
    {
        public string Type { get; set; }  // e.g., i32
        public string Value { get; set; } // e.g., 5
    }

    public class UnaryOpNode : WasmNode
    {
        public string Op { get; set; }     // e.g., drop
        public WasmNode Operand { get; set; }
    }

    public class BinaryOpNode : WasmNode
    {
        public string Op { get; set; }      // e.g., i32.add
        public WasmNode Left { get; set; }
        public WasmNode Right { get; set; }
    }

    public class IfNode : WasmNode
    {
        public WasmNode Condition { get; set; }
        public List<WasmNode> ThenBody { get; set; } = new();
        public List<WasmNode>? ElseBody { get; set; } = null;
    }

    public class BlockNode : WasmNode
    {
        public string? Label { get; set; }
        public List<WasmNode> Body { get; set; } = new();
    }

    public class LoopNode : WasmNode
    {
        public string? Label { get; set; }
        public List<WasmNode> Body { get; set; } = new();
    }

    public class RawInstructionNode : WasmNode
    {
        public string Instruction { get; set; }
    }

    public class WasmFunction
    {
        public List<WasmNode> Body { get; set; } = new();
    }

    public class WasmModule
    {
        public List<WasmFunction> Functions { get; set; } = new();
    }
}
