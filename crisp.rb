# Autogenerated from a Treetop grammar. Edits may be lost.


module Crisp
  include Treetop::Runtime

  def root
    @root ||= :operation
  end

  module Operation0
    def space
      elements[0]
    end

    def parameter
      elements[1]
    end
  end

  module Operation1
    def paren_start
      elements[0]
    end

    def space1
      elements[1]
    end

    def func
      elements[2]
    end

    def list
      elements[3]
    end

    def space2
      elements[4]
    end

    def paren_end
      elements[5]
    end
  end

  def _nt_operation
    start_index = index
    if node_cache[:operation].has_key?(index)
      cached = node_cache[:operation][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_paren_start
    s0 << r1
    if r1
      r2 = _nt_space
      s0 << r2
      if r2
        r3 = _nt_func
        s0 << r3
        if r3
          s4, i4 = [], index
          loop do
            i5, s5 = index, []
            r6 = _nt_space
            s5 << r6
            if r6
              r7 = _nt_parameter
              s5 << r7
            end
            if s5.last
              r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
              r5.extend(Operation0)
            else
              @index = i5
              r5 = nil
            end
            if r5
              s4 << r5
            else
              break
            end
          end
          if s4.empty?
            @index = i4
            r4 = nil
          else
            r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
          end
          s0 << r4
          if r4
            r8 = _nt_space
            s0 << r8
            if r8
              r9 = _nt_paren_end
              s0 << r9
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(Operation,input, i0...index, s0)
      r0.extend(Operation1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:operation][start_index] = r0

    r0
  end

  def _nt_parameter
    start_index = index
    if node_cache[:parameter].has_key?(index)
      cached = node_cache[:parameter][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    r1 = _nt_operation
    if r1
      r0 = r1
    else
      r2 = _nt_number
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:parameter][start_index] = r0

    r0
  end

  def _nt_func
    start_index = index
    if node_cache[:func].has_key?(index)
      cached = node_cache[:func][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    r1 = _nt_add_operator
    if r1
      r0 = r1
    else
      r2 = _nt_sub_operator
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:func][start_index] = r0

    r0
  end

  def _nt_add_operator
    start_index = index
    if node_cache[:add_operator].has_key?(index)
      cached = node_cache[:add_operator][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('+', false, index)
      r0 = instantiate_node(FuncAdd,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('+')
      r0 = nil
    end

    node_cache[:add_operator][start_index] = r0

    r0
  end

  def _nt_sub_operator
    start_index = index
    if node_cache[:sub_operator].has_key?(index)
      cached = node_cache[:sub_operator][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('-', false, index)
      r0 = instantiate_node(FuncSub,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('-')
      r0 = nil
    end

    node_cache[:sub_operator][start_index] = r0

    r0
  end

  def _nt_number
    start_index = index
    if node_cache[:number].has_key?(index)
      cached = node_cache[:number][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      i1 = index
      s2, i2 = [], index
      loop do
        if has_terminal?('\G[0-9]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      if s2.empty?
        @index = i2
        r2 = nil
      else
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      end
      if r2
        r1 = r2
      else
        if has_terminal?('0', false, index)
          r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('0')
          r4 = nil
        end
        if r4
          r1 = r4
        else
          @index = i1
          r1 = nil
        end
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(Number,input, i0...index, s0)
    end

    node_cache[:number][start_index] = r0

    r0
  end

  def _nt_space
    start_index = index
    if node_cache[:space].has_key?(index)
      cached = node_cache[:space][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[ \\t]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    r0 = instantiate_node(SyntaxNode,input, i0...index, s0)

    node_cache[:space][start_index] = r0

    r0
  end

  def _nt_paren_start
    start_index = index
    if node_cache[:paren_start].has_key?(index)
      cached = node_cache[:paren_start][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?("(", false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure("(")
      r0 = nil
    end

    node_cache[:paren_start][start_index] = r0

    r0
  end

  def _nt_paren_end
    start_index = index
    if node_cache[:paren_end].has_key?(index)
      cached = node_cache[:paren_end][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?(")", false, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure(")")
      r0 = nil
    end

    node_cache[:paren_end][start_index] = r0

    r0
  end

end

class CrispParser < Treetop::Runtime::CompiledParser
  include Crisp
end

