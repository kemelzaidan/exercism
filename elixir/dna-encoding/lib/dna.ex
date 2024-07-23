defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
      _ -> raise("Not a valid nucleotide.")
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def encode([]), do: nil

  def encode(dna) do
    do_encode(dna, <<>>)
  end

  defp do_encode([], acc), do: acc

  defp do_encode([head | tail], acc) do
    bit = <<encode_nucleotide(head)::4>>
    do_encode(tail, <<acc::bitstring, bit::bitstring>>)
  end

  def decode(bit_dna) do
    do_decode(bit_dna, ~c"")
  end

  defp do_decode(<<>>, acc), do: acc

  defp do_decode(bit_dna, acc) do
    <<head::4, tail::bitstring>> = bit_dna
    nucleotide = decode_nucleotide(head)
    do_decode(tail, acc ++ [nucleotide])
  end
end
