class StoneProver < Formula
  desc "Stone Prover"
  homepage "https://github.com/baking-bad/stone-prover"
  license "MIT"
  version "1.0.19"
  url "https://github.com/MrRoudyk/stone-packaging/releases/download/v1.0.19/stone-prover-macos-arm64.tar.gz"
  sha256 "9be65dddb491f3b4ce67948a4e98c676f318c46e7e9442993290ef3e0afa9782"
  
  depends_on "gmp"
  depends_on "python@3.9"

  def install
    bin.install "cpu_air_prover-arm64" => "cpu_air_prover"
    bin.install "cpu_air_verifier-arm64" => "cpu_air_verifier"
  end

  test do
    %w[cpu_air_prover cpu_air_verifier].each do |binary|
      assert_match version.to_s, shell_output("#{bin}/#{binary} --version")
    end
  end
end
