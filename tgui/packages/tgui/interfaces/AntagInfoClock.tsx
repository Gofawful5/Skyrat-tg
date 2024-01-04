// THIS IS A SKYRAT UI FILE
import { useBackend } from '../backend';
import { Icon, Section, Stack } from '../components';
import { Window } from '../layouts';
<<<<<<< HEAD
=======
import { Rules } from './AntagInfoRules';
>>>>>>> f23ee25178faa842ef68ab7996cbdff89bde47d2

type Info = {
  antag_name: string;
};

<<<<<<< HEAD
export const AntagInfoClock = (props, context) => {
  const { data } = useBackend<Info>(context);
=======
export const AntagInfoClock = (props) => {
  const { data } = useBackend<Info>();
>>>>>>> f23ee25178faa842ef68ab7996cbdff89bde47d2
  const { antag_name } = data;
  return (
    <Window width={620} height={250} theme="clockwork">
      <Window.Content>
        <Section scrollable fill>
          <Stack vertical>
            <Stack.Item fontSize="20px" color={'good'}>
              <Icon name={'cog'} rotation={0} spin />
              {' You are the ' + antag_name + '! '}
              <Icon name={'cog'} rotation={35} spin />
            </Stack.Item>
<<<<<<< HEAD
=======
            <Stack.Item>
              <Rules />
            </Stack.Item>
>>>>>>> f23ee25178faa842ef68ab7996cbdff89bde47d2
            <Stack.Item>
              <ObjectivePrintout />
            </Stack.Item>
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};

const ObjectivePrintout = (props) => {
  const { data } = useBackend<Info>();
  return (
    <Stack vertical>
      <Stack.Item bold>Your goals:</Stack.Item>
      <Stack.Item>
        {
          '- Further the goals of any other organization you are a part of using the power granted to you.'
        }
      </Stack.Item>
      <Stack.Item>
        {
          '- Further the grace, knowledge, and glory of our great lord of the Engine, Ratvar.'
        }
      </Stack.Item>
    </Stack>
  );
};
