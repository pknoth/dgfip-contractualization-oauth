import ReactTestRenderer from 'react-test-renderer'
import LoginForm from '../login-form'

describe('components | LoginForm', () => {
  describe('render', () => {
    const renderer = ReactTestRenderer.create(<LoginForm />)
    it('should be defined', () => {
      expect(renderer).toBeDefined()
    })
    it('should match snapshot', () => {
      expect(renderer).toMatchSnapshot()
    })
  })
})
