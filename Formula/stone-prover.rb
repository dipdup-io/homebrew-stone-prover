class StoneProver < Formula
  desc "Stone Prover"
  homepage "https://github.com/baking-bad/stone-prover"
  url "https://github.com/dipdup-io/stone-packaging/archive/refs/tags/v3.0.2.tar.gz"
  sha256 "3a173baa96ba36999885f26eda8b98ca89433a1a027e62d2ae8440e784baf3cf"
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
