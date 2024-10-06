class StoneProver < Formula
  desc "Stone Prover"
  homepage "https://github.com/baking-bad/stone-prover"
  license "MIT"
  version "1.0.17"

  depends_on "gmp"
  depends_on "python@3.9"

  if Hardware::CPU.arm?
    url "https://github.com/MrRoudyk/stone-packaging/releases/download/v1.0.17/cpu_air_prover-arm64.tar.gz"
    sha256 "5cd83f442f77238540e04d90f9e58715414a2c6595fb0213d8ec3d03b0561958"
  else
    url "https://github.com/MrRoudyk/stone-packaging/releases/download/v1.0.17/cpu_air_prover-x86_64.tar.gz"
    sha256 "aaa45b26b6389295789903577b7a0e580ed2305e5757b8acd6a8e65cdb844a4d"
  end

  def install
    arch = Hardware::CPU.arch
    bin.install "cpu_air_prover-#{arch}" => "cpu_air_prover"
    bin.install "cpu_air_verifier-#{arch}" => "cpu_air_verifier"
  end

  test do
    %w[cpu_air_prover cpu_air_verifier].each do |binary|
      assert_match version.to_s, shell_output("#{bin}/#{binary} --version")
    end
  end
end
