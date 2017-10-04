
// License: BSD 3 clause


%include std_shared_ptr.i
%shared_ptr(HawkesSDCALoglikKern);

%{
#include "hawkes_sdca_loglik_kern.h"
%}

class HawkesSDCALoglikKern : public ModelHawkesList {
 public:
  HawkesSDCALoglikKern(ArrayDouble &decay, double l_l2sq,
                         int max_n_threads = 1, double tol = 0.,
                         RandType rand_type = RandType::unif, int seed = -1);

  HawkesSDCALoglikKern(double decay, double l_l2sq,
                       int max_n_threads = 1, double tol = 0.,
                       RandType rand_type = RandType::unif, int seed = -1);

  void compute_weights();

  void solve();

  SArrayDoublePtr get_decays() const;
  void set_decays(const ArrayDouble &decays);

  SArrayDoublePtr get_iterate();
  SArrayDoublePtr get_dual_iterate();
  double get_l_l2sq() const;
  void set_l_l2sq(const double l_l2sq);
  double get_max_dual() const;
  void set_max_dual(const double l_l2sq);

  double loss(const ArrayDouble &coeffs) override;
  double current_dual_objective();
};