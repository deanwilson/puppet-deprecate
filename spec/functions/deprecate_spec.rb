require 'spec_helper'
require 'timecop'

describe 'deprecate' do
  ############### Test normal usage

  describe 'before the deprecation has expired' do
    it 'should return nil' do
      Timecop.freeze(Time.local('2015-01-24'))

      should run.with_params('2015-01-25', 'Remove Foo at the end of the contract.').and_return(nil)

      Timecop.return
    end
  end

  ############### Test expired usage

  describe 'after the deprecation has expired' do
    it 'should fail' do
      Timecop.freeze(Time.local('2015-01-26'))

      should run.with_params('2015-01-25', 'Remove Foo at the end of the contract.').and_return(nil)

      Timecop.return
    end

    it 'should fail and abort the compiliation' do
      Timecop.freeze(Time.local('2015-01-26'))

      should run.with_params('2015-01-25', 'Remove Foo at the end of the contract.', true).and_return(nil)

      Timecop.return
    end
  end

  ############### Test error conditions

  describe 'handling expected error conditions' do
    it 'should throw ArgumentError if not called with 2 or 3 arguments' do
      should run.with_params.and_raise_error(ArgumentError)
    end

    it 'should throw ArgumentError if provided with an invalid date' do
      should run.with_params('2015012512', 'Test').and_raise_error(ArgumentError)
    end
  end
end
