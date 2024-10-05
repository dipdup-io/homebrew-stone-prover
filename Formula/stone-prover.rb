class StoneProver < Formula
  desc "Stone Prover"
  homepage "https://github.com/baking-bad/stone-prover"
  license "MIT"

  url "https://github.com/MrRoudyk/stone-packaging/releases/download/v1.0.9/stone-prover-1.0.9-macos-arm64.tar.gz"
  sha256 "8ed584e4834dc77593d107b1413688deba73814f3aacf863672aea2daadfdb0d"
  version "1.0.9"

  depends_on "gmp"
  depends_on "python@3.9"

  def install
    bin.install "cpu_air_prover-#{arch_suffix}" => "cpu_air_prover"
    bin.install "cpu_air_verifier-#{arch_suffix}" => "cpu_air_verifier"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cpu_air_prover --version")
    assert_match version.to_s, shell_output("#{bin}/cpu_air_verifier --version")
  end

  def arch_suffix
    Hardware::CPU.arm? ? "arm64" : "x86_64"
  end
end
