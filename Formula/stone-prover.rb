class StoneProver < Formula
  desc "Stone Prover"
  homepage "https://github.com/baking-bad/stone-prover"
  license "MIT"
  version "3.0.3"
  url "https://github.com/dipdup-io/stone-packaging/releases/download/v3.0.3/stone-prover-macos-arm64.tar.gz"
  sha256 "55b12ab37c09345956352073a6b70c9656b53bb899c22eb628ebbc2fe2292f19"
  
  depends_on "gmp"

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
