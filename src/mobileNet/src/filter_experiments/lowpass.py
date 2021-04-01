
class LowPass:
    def __init__(self):
        self.threshold = 1000 # in mm
        self.prev_depth = -1
        self.curr_depth = 0
        self.alpha = 0.1

    def addDepth(self, new_depth):
        if self.prev_depth == -1:
            self.prev_depth = new_depth
            return

        diffCurrToPrev = abs(new_depth - self.prev_depth)
        if (diffCurrToPrev > self.threshold):
            self.prev_depth = -1
            self.curr_depth = -1
        else:
            prevLowPass = (1-self.alpha) * self.prev_depth
            currLowPass = self.alpha * new_depth
            self.curr_depth = prevLowPass + currLowPass
            self.prev_depth = self.curr_depth


    def getDepth(self):
        return self.curr_depth
