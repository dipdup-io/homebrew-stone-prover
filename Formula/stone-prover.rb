class StoneProver < Formula
  desc "Stone Prover"
  homepage "https://github.com/baking-bad/stone-prover"
  license "MIT"
  version "1.0.32"
  url "https://github.com/MrRoudyk/stone-packaging/releases/download/v1.0.32/stone-prover-macos-arm64.tar.gz"
  sha256 "f0a705532639ebd3e22aa14907d329667e77d974f035cb3e8ff9828b2f2957f5"
  
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
