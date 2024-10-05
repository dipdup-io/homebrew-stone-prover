class StoneProver < Formula
  desc "Stone Prover"
  homepage "https://github.com/baking-bad/stone-prover"
  url "https://github.com/mrroudyk/stone-packaging/releases/download/v1.0.0/stone-prover-1.0.0.tar.gz"
  sha256 "PLACEHOLDER_FOR_SHA256"
  license "MIT"

  depends_on "gmp"
  depends_on "python@3.9"
  depends_on "bazelisk" => :build

  def install
    system "bazelisk", "build", "//..."
    bin.install Dir["bazel-bin/src/starkware/main/cpu/*"].select { |f| File.executable?(f) }
  end

  test do
    system "#{bin}/cpu_air_prover", "--version"
    system "#{bin}/cpu_air_verifier", "--version"
  end
end
