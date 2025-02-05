public class CustomTeamA implements Team {
    private static final int MAX_INACTIVITY_PERIOD = 1000;
    private static final float GOALIER_SPEED_MULTIPLIER = 1.5f;

    private long lastActiveTime = 0;

    public String getTeamName() {
        return "Horriver Plate";
    }

    public void setTeamSide(TeamSide side) {}

    public Robot buildRobot(GameSimulator s, int index) {
        if (index == 0)
            return new Attacker(s);
        else if (index == 1)
            return new Goalier(s);

        return new Attacker(s);
    }

    class Attacker extends RobotBasic {
        Attacker(GameSimulator s) {
            super(s);
        }

        float speedMultiplier = 2.0f;

        Sensor locator;

        public void setup() {
            System.out.println("Attacker: Running!");
            locator = getSensor("BALL");
        }

        public void loop() {
            float angle = locator.readValue(0);

            setRotation(angle * speedMultiplier);
            setSpeed(1.0f, 0);
        }
    }

    class Goalier extends RobotBasic {
        Goalier(GameSimulator s) {
            super(s);
        }

        Sensor locator;

        public void setup() {
            System.out.println("Goalier: Running!");
            locator = getSensor("BALL");
        }

        public void loop() {
            float angle = locator.readValue(0);

            setRotation(angle * GOALIER_SPEED_MULTIPLIER);
            setSpeed(1.0f, 0);
        }
    }
}
