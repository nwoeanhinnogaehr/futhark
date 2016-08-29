-- ==
-- input {
--   [[1.0,1.0,1.0,1.0,1.0],[1.0,1.0,1.0,1.0,1.0],[1.0,1.0,1.0,1.0,1.0]]
--   [[2.0,2.0,2.0,2.0,2.0],[2.0,2.0,2.0,2.0,2.0],[2.0,2.0,2.0,2.0,2.0]]
-- }
-- output {
--     [[2.0,2.0,2.0,2.0,2.0],[2.0,2.0,2.0,2.0,2.0],[2.0,2.0,2.0,2.0,2.0]]
-- }

fun combineVs(n_row:   [num_und]f64)
             (vol_row: [num_und]f64): [num_und]f64 =
  zipWith (*) n_row vol_row

fun mkPrices(md_vols:   [num_dates][num_und]f64,
             noises: [num_dates][num_und]f64
            ): [num_dates][num_und]f64 =
  zipWith combineVs noises md_vols

fun main(vol: [][]f64, noises: [][]f64): [][]f64 = mkPrices(vol,noises)
