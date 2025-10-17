from pychoco import Model
from typing import List
from collections import defaultdict

def getmodel():
    model = Model("DCSP")
    Xs = model.intvars(10, 0, 9)
    model.all_different(Xs).post()
    return Xs, model

def modConstraint(Xs, base:int = 10, model: Model = None):
    for i in range(10):
        for j in range(i+1, 10):
            tmp = (Xs[i] + Xs[j])
            model.mod(tmp, base, (i + j) % base).post()
        
def Aggregate(Solutions: List[List[int]]):
    # Aggregate solutions to the common ones 
    aggregated_sols = defaultdict(set)
    for solution in Solutions:
        for i in range(10):
            aggregated_sols[i].add(solution[i])
            
    return aggregated_sols

def solutionOfMod(mod_base):
    Xs, model = getmodel()
    modConstraint(Xs, mod_base, model)
    Solver = model.get_solver()
    res = Solver.find_all_solutions()
    Solutions = [[sol.get_int_val(x) for x in Xs] for sol in res]
    Solutions = Aggregate(Solutions)
    return Solutions

def solutionOfEnsemble(mod_base_1, mod_base_2):
    Xs, model = getmodel()
    modConstraint(Xs, mod_base_1, model)
    modConstraint(Xs, mod_base_2, model)
    Solver = model.get_solver()
    res = Solver.find_all_solutions()
    return len(res)

if __name__ == '__main__':
    
    mod_base_1 = 3
    mod_base_2 = 5
    Solutions = solutionOfMod(mod_base_1)
    print(Solutions)
    
    num_sols = solutionOfEnsemble(mod_base_1, mod_base_2)
    print(num_sols)