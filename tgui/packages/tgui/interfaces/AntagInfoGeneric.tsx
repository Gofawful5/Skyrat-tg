import { useBackend } from '../backend';
import { Section, Stack } from '../components';
import { Window } from '../layouts';
<<<<<<< HEAD
import { ObjectivePrintout, Objective } from './common/Objectives';
=======
import { Rules } from './AntagInfoRules'; // SKYRAT EDIT ADDITION
import { Objective, ObjectivePrintout } from './common/Objectives';
>>>>>>> f23ee25178faa842ef68ab7996cbdff89bde47d2

type Info = {
  antag_name: string;
  objectives: Objective[];
};

<<<<<<< HEAD
export const AntagInfoGeneric = (props, context) => {
  const { data } = useBackend<Info>(context);
=======
// SKYRAT EDIT increase height from 250 to 500
export const AntagInfoGeneric = (props) => {
  const { data } = useBackend<Info>();
>>>>>>> f23ee25178faa842ef68ab7996cbdff89bde47d2
  const { antag_name, objectives } = data;
  return (
    <Window width={620} height={250}>
      <Window.Content>
        <Section scrollable fill>
          <Stack vertical>
            <Stack.Item textColor="red" fontSize="20px">
              You are the {antag_name}!
            </Stack.Item>
            <Stack.Item>
              <ObjectivePrintout objectives={objectives} />
            </Stack.Item>
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};
