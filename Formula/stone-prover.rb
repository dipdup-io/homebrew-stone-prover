class StoneProver < Formula
  desc "Stone Prover"
  homepage "https://github.com/baking-bad/stone-prover"
  license "MIT"
  version "1.0.9"

  depends_on "gmp"
  depends_on "python@3.9"

  bottle do
    root_url "https://github.com/MrRoudyk/stone-packaging/releases/download/v#{version}"
    sha256 cellar: :any_skip_relocation, sonoma: "${SHA256_x86_64}"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "${SHA256_arm64}"
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin.install "cpu_air_prover-#{arch}" => "cpu_air_prover"
    bin.install "cpu_air_verifier-#{arch}" => "cpu_air_verifier"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cpu_air_prover --version")
    assert_match version.to_s, shell_output("#{bin}/cpu_air_verifier --version")
  end
end
