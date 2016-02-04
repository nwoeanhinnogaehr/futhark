-- ==
-- input {
--   {3, 300}
-- }
-- output {
--   [100.0,100.0,100.0]
-- }
fun *[real,n_histo] main(int n_histo, int n_image) =
  let A = iota(n_image) in
  streamRedPerMax( fn *[real] ([real] a, [real] b) =>
                        zipWith( +, a, b )
                 , fn *[real] (int chunk, *[real] acc, [int] a) =>
                        loop (acc) = for i < chunk do
                            let ind = a[i] % n_histo      in
                            let acc[ind] = acc[ind] + 1.0 in
                            acc
                        in  acc
                 , replicate(n_histo,0.0), A
                 )
