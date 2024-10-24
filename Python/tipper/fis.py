#!python

import numpy as np
import skfuzzy as fuzz
from skfuzzy import control as ctrl


class Tipper():
    def __init__(self):
        f = ctrl.Antecedent(np.arange(0, 11, 1), 'food')
        s = ctrl.Antecedent(np.arange(0, 11, 1), 'service')
        t = ctrl.Consequent(np.arange(0, 11, 1), 'tip')

        f['rancid'] = fuzz.trapmf(f.universe, [0, 0, 2, 4])
        f['delicious'] = fuzz.trapmf(f.universe, [6, 8, 10, 10])

        s['poor'] = fuzz.trapmf(s.universe, [0, 0, 2, 4])
        s['good'] = fuzz.trapmf(s.universe, [3, 4, 6, 7])
        s['excellent'] = fuzz.trapmf(s.universe, [6, 8, 10, 10])

        t['cheap'] = fuzz.trapmf(t.universe, [0, 0, 1, 3])
        t['average'] = fuzz.trapmf(t.universe, [2, 4, 6, 8])
        t['generous'] = fuzz.trapmf(t.universe, [7, 9, 10, 10])

        # Fuzzy Rule Base
        r1 = ctrl.Rule(f['rancid'] |
                       s['poor'], t['cheap'])
        r2 = ctrl.Rule(s['good'], t['average'])
        r3 = ctrl.Rule(f['delicious'] |
                       s['excellent'], t['generous'])

        # Control System
        self._plant = ctrl.ControlSystemSimulation(
            ctrl.ControlSystem([r1, r2, r3]))

    @property
    def food(self):
        return self._plant.input['food']

    @food.setter
    def food(self, value):
        self._plant.input['food'] = value

    @property
    def service(self):
        return self._plant.input['service']

    @service.setter
    def service(self, value):
        self._plant.input['service'] = value

    @property
    def tip(self):
        return self._plant.output['tip']

    def evaluate_fis(self, inputs):
        # self._plant.input['food'] = inputs['food']
        self.food = inputs['food']
        self.service = inputs['service']
        self._plant.compute()


if __name__ == "__main__":
    tipper = Tipper()
    tipper.evaluate_fis({'food': 7, 'service': 5})
    print(tipper.tip)
